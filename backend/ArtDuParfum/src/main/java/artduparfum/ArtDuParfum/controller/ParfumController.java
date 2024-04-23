package artduparfum.ArtDuParfum.controller;

import artduparfum.ArtDuParfum.repository.dto.request.UserLoginDTO;
import artduparfum.ArtDuParfum.repository.dto.response.ParfumResponseDTO;
import artduparfum.ArtDuParfum.repository.dto.response.UserLoginResponseDTO;
import artduparfum.ArtDuParfum.service.ParfumService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/api/v1/parfumes")
public class ParfumController {

    private final ParfumService parfumService;

    public ParfumController(ParfumService parfumService) {
        this.parfumService = parfumService;
    }

    @GetMapping("/selectCategory/{category}")
    public String selectCategory(@PathVariable String category) {

        return "redirect:/parfumes/" + category;
    }

    @GetMapping("/parfumes/male")
    public String showMaleParfums() {

        return "pagina_tipuri_parfumuri_male";
    }

    @GetMapping("/parfumes/female")
    public String showFemaleParfums() {

        return "pagina_tipuri_parfumuri_female";
    }

    @GetMapping("/parfumes/unisex")
    public String showUnisexParfums() {

        return "pagina_tipuri_parfumuri_unisex";
    }

}
