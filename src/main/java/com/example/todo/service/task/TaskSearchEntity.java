package com.example.todo.service.task;

import org.springframework.scheduling.config.Task;

import java.util.List;

public record TaskSearchEntity(
        String summary,
        List<TaskStatus> status
) {
}
