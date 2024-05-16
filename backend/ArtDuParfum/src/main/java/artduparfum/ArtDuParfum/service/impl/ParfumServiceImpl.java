package artduparfum.ArtDuParfum.service.impl;

import artduparfum.ArtDuParfum.exception.UserNotFoundException;
import artduparfum.ArtDuParfum.repository.ParfumRepository;
import artduparfum.ArtDuParfum.repository.UserRepository;
import artduparfum.ArtDuParfum.repository.dto.request.ParfumDTO;
import artduparfum.ArtDuParfum.repository.dto.response.ParfumResponseDTO;
import artduparfum.ArtDuParfum.repository.entity.Parfum;
import artduparfum.ArtDuParfum.repository.entity.User;
import artduparfum.ArtDuParfum.repository.enums.Destination;
import artduparfum.ArtDuParfum.service.ParfumService;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.stereotype.Service;

import java.lang.reflect.Type;
import java.util.List;

@Service
public class ParfumServiceImpl implements ParfumService {

    private final ParfumRepository parfumRepository;
    private final ModelMapper modelMapper;
    private final UserRepository userRepository;

    public ParfumServiceImpl(ParfumRepository parfumRepository, ModelMapper modelMapper, UserRepository userRepository) {
        this.parfumRepository = parfumRepository;
        this.modelMapper = modelMapper;
        this.userRepository = userRepository;
    }

    @Override
    public ParfumResponseDTO createParfum(Long id, ParfumDTO parfumDTO, Destination destination) {

        User user = userRepository.findById(id).orElseThrow(UserNotFoundException::new);

        // Mapează ParfumDTO la Parfum folosind ModelMapper
        Parfum parfum = modelMapper.map(parfumDTO, Parfum.class);

        if(destination == Destination.CART){
            parfum.setUser2(user);
            user.getCart().add(parfum);
        }else{
            parfum.setUser(user);
            user.getFavouriteParfumes().add(parfum);
        }

        // Salvează Parfum-ul în baza de date
        parfum = parfumRepository.save(parfum);
        userRepository.save(user);

        // Returnează un parfum
        return modelMapper.map(parfum, ParfumResponseDTO.class);
    }

    @Override
    public List<ParfumResponseDTO> getCart(Long id) {
        User user = userRepository.findById(id).orElseThrow(UserNotFoundException::new);
        Type listType = new TypeToken<List<ParfumResponseDTO>>(){}.getType();
        return modelMapper.map(user.getCart(), listType);
    }

    @Override
    public List<ParfumResponseDTO> getFavourite(Long id) {
        User user = userRepository.findById(id).orElseThrow(UserNotFoundException::new);
        Type listType = new TypeToken<List<ParfumResponseDTO>>(){}.getType();
        return modelMapper.map(user.getFavouriteParfumes(), listType);
    }
}
