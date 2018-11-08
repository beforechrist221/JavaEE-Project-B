package project.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Mail implements Serializable {
    private String emailHost;
    private String emailFrom;
    private String emailUsername;
    private String emailPassword;
    private String toEmails;
    private String subject;
    private String content;
    private Map<String, String> pictures;
    private Map<String, String> attachments;
    private String fromAddress;
    private String toAddresses;
    private String[] attachFileNames;
}
