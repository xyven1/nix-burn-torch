use burn::{
    backend::{libtorch::LibTorchDevice, LibTorch},
    tensor::Tensor,
};

fn main() {
    let device = LibTorchDevice::Cuda(0);
    let tensor = Tensor::<LibTorch, 2>::from_floats([[1, 2], [3, 4]], &device);
    let tensor2 = Tensor::<LibTorch, 2>::from_floats([[5, 6], [7, 8]], &device);
    let prod = tensor.matmul(tensor2);
    println!("{prod}");
}
