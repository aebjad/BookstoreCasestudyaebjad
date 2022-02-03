package perscholas.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@EnableJpaRepositories(basePackages = "perscholas.database") // path to dao & entity packages perscholas.database
public class DatabaseConfig {
}
