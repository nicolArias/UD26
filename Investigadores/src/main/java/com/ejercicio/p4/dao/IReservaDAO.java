package com.ejercicio.p4.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ejercicio.p4.dto.Reserva;

public interface IReservaDAO extends JpaRepository<Reserva, Integer>{

}
