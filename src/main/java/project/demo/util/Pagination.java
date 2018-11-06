package project.demo.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pagination<T extends Serializable> implements Serializable {
    private List<T> list;
    private String sqlId;
    private int pageSize, totalRows, totalPages, currentPage;
}
