// OrderRepository.java
package com.lugx.gamingHouse.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.lugx.gamingHouse.domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
}
