package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.entity.BrandEntity;
import com.entity.UserEntity;
@Repository
public interface iBrandRepo extends JpaRepository<BrandEntity, Integer> {
   BrandEntity findById(int id);
}
