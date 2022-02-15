package perscholas.database.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import perscholas.database.entity.UserRole;

public interface UserRoleDAO extends JpaRepository<UserRole, Long> {


}
