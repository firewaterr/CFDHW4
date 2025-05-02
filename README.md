# CFDHW4
## 2200011013 王煜沣 2025.5.2
4th homework of CFD

本作业中包含两个文件和三个文件夹，使用MATLAB语言编写。

'homework.pdf'文件为作业原文。'README.md'文件为本文件。

'code'文件夹中包含本次作业的所有代码，'homework4_x.m'为第x问的解决方案，需要助教学长运行一下，检查作业是否无误。'iterateTemperatureField.m'为松弛法迭代求解温度场的函数。

'figs'文件夹为报告中所有出现的图片，根据图片标题，有相应的适用问题：温度云图为第一问代码的结果;迭代步数、时间随松弛因子变化的六张图为的第二问代码的结果（代码直接运行能得到'Iterations for Different Relaxation Factors, Mesh Size = 15x12.jpg','Time for Different Relaxation Factors, Mesh Size = 15x12.jpg'两张图的结果，其余图需要改变Nx,Ny为相应值）;最佳松弛因子随网格尺度变化的图为第三问的结果。

'reports'文件夹包含主报告'homework4.pdf'和AI使用报告'AIUsageReport.md'两个文件。

## 请注意

运行代码前请先解压文件。

在运行代码时，需要将'code'文件夹添加到MATLAB的路径中，否则可能出现函数无法调用的情况。