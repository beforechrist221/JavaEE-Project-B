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
@RequestMapping("")
@ResponseBody
public Map<String, Object> method(){
    Map<String, Object> map = new HashMap<>();
    map.put("key", "value");
    return map; // {"key": "value"}
}
```

### GitHub
1. install git (default)
[https://git-scm.com/](https://git-scm.com/)

2. IDEA - File - Settings - git -> git.exe - Test

3. IDEA - File - Settings - GitHub - add account

4. Checkout...

5. Ctrl + K

6. Ctrl + T
