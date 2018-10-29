package project.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("upload")
public class UploadController extends BaseController {

    private static final String PHOTO_PATH = "/assets/photos";

    @RequestMapping("photo")
    public String photo(@RequestParam MultipartFile photoFile) throws IOException {
        String photoPath = application.getRealPath(PHOTO_PATH);
        photoFile.transferTo(new File(photoPath, photoFile.getOriginalFilename()));
        System.out.println(photoFile.getOriginalFilename());
        return "redirect:/upload-test.jsp";
    }
}
