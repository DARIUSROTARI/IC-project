package artduparfum.ArtDuParfum.service.impl;

import artduparfum.ArtDuParfum.repository.ParfumRepository;
import artduparfum.ArtDuParfum.repository.UserRepository;
import artduparfum.ArtDuParfum.repository.dto.request.ParfumDTO;
import artduparfum.ArtDuParfum.repository.dto.response.ParfumResponseDTO;
import artduparfum.ArtDuParfum.repository.entity.Parfum;
import artduparfum.ArtDuParfum.service.ParfumService;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
public class ParfumServiceImpl implements ParfumService {

    private final ParfumRepository parfumRepository;
    private final ModelMapper modelMapper;

    public ParfumServiceImpl(ParfumRepository parfumRepository, ModelMapper modelMapper) {
        this.parfumRepository = parfumRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public ParfumResponseDTO createParfum(ParfumDTO parfumDTO) {
        // Mapează ParfumDTO la Parfum folosind ModelMapper
        Parfum parfum = modelMapper.map(parfumDTO, Parfum.class);

        // Salvează Parfum-ul în baza de date
        parfum = parfumRepository.save(parfum);

        // Returnează un ParfumResponseDTO cu detaliile parfumului creat
        return modelMapper.map(parfum, ParfumResponseDTO.class);
    }
}
