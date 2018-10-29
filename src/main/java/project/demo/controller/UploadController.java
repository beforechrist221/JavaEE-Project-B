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

    @RequestMapping("test")
    public String test(@RequestParam MultipartFile[] photoFiles) throws IOException {
        String photoPath = application.getRealPath(PHOTO_PATH);
        for (MultipartFile photoFile : photoFiles) {
            photoFile.transferTo(new File(photoPath, System.nanoTime() + ".png"));
        }
        return "redirect:/upload-test.jsp";
    }
}
