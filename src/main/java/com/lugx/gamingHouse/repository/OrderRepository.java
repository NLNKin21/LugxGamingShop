// OrderRepository.java
package com.lugx.gamingHouse.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import com.lugx.gamingHouse.domain.Order;
import com.lugx.gamingHouse.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    @Query("SELECT COALESCE(SUM(o.totalPrice), 0) FROM Order o WHERE o.status = :status")
    double sumTotalPriceByStatus(@Param("status") String status);

    // @Query("SELECT COALESCE(SUM(o.totalPrice), 0) FROM Order o")
    // double sumAllTotalPrice();

    // ear chart
    @Query("SELECT MONTH(o.orderDate), SUM(o.totalPrice) " +
            "FROM Order o " +
            "WHERE o.status = 'COMPLETE' AND YEAR(o.orderDate) = :year " +
            "GROUP BY MONTH(o.orderDate) " +
            "ORDER BY MONTH(o.orderDate)")
    List<Object[]> findMonthlyEarnings(@Param("year") int year);

    List<Order> findByUser(User user);
}
