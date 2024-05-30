package artduparfum.ArtDuParfum.controller;

import artduparfum.ArtDuParfum.repository.dto.request.ParfumDTO;
import artduparfum.ArtDuParfum.repository.dto.request.UserLoginDTO;
import artduparfum.ArtDuParfum.repository.dto.response.ParfumResponseDTO;
import artduparfum.ArtDuParfum.repository.dto.response.UserLoginResponseDTO;
import artduparfum.ArtDuParfum.repository.enums.Destination;
import artduparfum.ArtDuParfum.service.ParfumService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RestController
@RequestMapping("/api/v1/parfumes")
public class ParfumController {

    private final ParfumService parfumService;

    public ParfumController(ParfumService parfumService) {
        this.parfumService = parfumService;
    }

   @PostMapping("/user-id={id}/destination={destination}")
   public ResponseEntity<ParfumResponseDTO> createParfum(@PathVariable Long id, @PathVariable Long destination, @RequestBody ParfumDTO parfumDTO){
       Destination destination1 = destination==0? Destination.CART : Destination.FAVOURITE;
        return new ResponseEntity<>(parfumService.createParfum(id,parfumDTO,destination1), HttpStatus.CREATED);
   }

   @GetMapping("/user-id={id}/cart")
    public ResponseEntity<List<ParfumResponseDTO>> getCart(@PathVariable Long id){
        return new ResponseEntity<>(parfumService.getCart(id), HttpStatus.OK);
   }

    @GetMapping("/user-id={id}/favourite")
    public ResponseEntity<List<ParfumResponseDTO>> getFavourite(@PathVariable Long id){
        return new ResponseEntity<>(parfumService.getFavourite(id), HttpStatus.OK);
    }

    @DeleteMapping("/user-id={id}/cart/{parfumId}")
    public ResponseEntity<Void> deleteFromCart(@PathVariable Long id, @PathVariable Long parfumId) {
        parfumService.deleteFromCart(id, parfumId);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @DeleteMapping("/user-id={id}/favourite/{parfumId}")
    public ResponseEntity<Void> deleteFromFavourite(@PathVariable Long id, @PathVariable Long parfumId) {
        parfumService.deleteFromFavourite(id, parfumId);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PutMapping("/user-id={id}/move-favourite-to-cart/{parfumId}")
    public ResponseEntity<Void> moveFromFavouriteToCart(@PathVariable Long id, @PathVariable Long parfumId) {
        parfumService.moveFromFavouriteToCart(id, parfumId);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
