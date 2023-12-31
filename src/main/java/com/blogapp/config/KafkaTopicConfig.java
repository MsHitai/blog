package com.blogapp.config;

import org.apache.kafka.clients.admin.NewTopic;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.config.TopicBuilder;

@Configuration
public class KafkaTopicConfig {

    @Bean
    public NewTopic webBlogTopic() {
        return TopicBuilder.name("webBlog")
                .build();
    }

    @Bean
    public NewTopic postViewTopic() {
        return TopicBuilder.name("posts-views")
                .build();
    }
}
