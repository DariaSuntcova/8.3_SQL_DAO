package ru.netology.repository;

import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@org.springframework.stereotype.Repository
public class Repository {

    private final NamedParameterJdbcTemplate template;
    private final String requestScript;

    public Repository(NamedParameterJdbcTemplate template) {
        this.template = template;
        this.requestScript = read();
    }

    private static String read() {
        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(
                new ClassPathResource("product_by_name.sql").getInputStream()))) {
            return bufferedReader.lines().collect(Collectors.joining("\n"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public List<String> getProductName(String name) {
        var debug = template.queryForList(requestScript, Map.of("name", name), String.class);
        System.out.println(debug);
        return debug;
    }
}
