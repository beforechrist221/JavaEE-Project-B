package project.demo.service;

import org.springframework.web.multipart.MultipartFile;
import project.demo.model.Product;

public interface ProductService extends GenericService<Product, Integer> {

    Product getProductWithPictures(
            Product product,
            MultipartFile coverPictures,
            MultipartFile[] slidePictures,
            MultipartFile[] detailPictures);
}