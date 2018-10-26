# Java EE Project Demo

> Class B

### 项目结构

1. portal 门户

2. backEnd 后台

### Spring MVC JSON
1. build.gradle
    - jackson-core
    - jackson-databind
    - jackson-annotation
```
compile 'com.fasterxml.jackson.core:jackson-databind:2.9.7'
```

2. controller
```java
@RequestMapping("");
@ResponseBody
public Map method(){
    map.put(key, value);
    return map; // {"key": value}
}
```