import os
import sys

import ssl
#ssl._create_default_https_context = ssl._create_unverified_context

import torch
import torchvision

import echonet

frames = 32 
period = 1
batch_size = 20

if not torch.has_cuda:
    os.write(2, "torch.has_cuda == False")
    os.exit(1)

device = "cuda"
model = torchvision.models.video.r2plus1d_18(pretrained=True)
model = torch.nn.DataParallel(model)
model.to(device)

#checkpoint = torch.load(os.path.join(os.getcwd(), 'models', 'r2plus1d_18_32_2_pretrained.pt'))
#model.load_state_dict(checkpoint['state_dict'])

ds = echonet.datasets.Echo(os.path.join(os.getcwd(), 'EchoNet-Dynamic'))
mean, std = echonet.utils.get_mean_and_std(ds)

kwargs = { 
    "target_type": "EF",
    "mean": mean,
    "std" : std,
    "length": frames, 
    "period": period
}

ds = echonet.datasets.Echo(os.path.join(os.getcwd(), 'EchoNet-Dynamic'), **kwargs)

dataloader = torch.utils.data.DataLoader(ds, batch_size=1, num_workers = 5, shuffle = True, pin_memory = torch.cuda.is_available())

for p in model.parameters():
	p.requires_grad = True

params = [p for p in model.parameters() if p.requires_grad]
optim = torch.optim.SGD(params, lr=0.001,
                                momentum=0.9, 
                                weight_decay=0.0005)
loss, yhat, y = echonet.utils.video.run_epoch(model = model, dataloader = dataloader, train = True, optim = optim, device = device, save_all=True, block_size=25)


for (filename, pred) in zip(ds.fnames, yhat):
    for (i,p) in enumerate(pred):
        print("{},{},{:.4f}\n".format(filename, i, p))

