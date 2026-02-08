# vcpkg 项目模板

这是一个使用 [vcpkg](https://github.com/microsoft/vcpkg) 进行 C++ 依赖管理的项目模板。该模板通过 CMake 的 `FetchContent` 自动下载和配置 vcpkg，无需手动安装。

## 特性

- ✅ 自动下载和配置 vcpkg（无需手动安装）
- ✅ 使用 CMake 4.0+ 和 C++20 标准
- ✅ 支持跨平台（Windows、macOS、Linux）
- ✅ 通过 `vcpkg.json` 声明式管理依赖
- ✅ 集成 GitHub Actions 自动初始化项目名称

## 快速开始

### 前置要求

- CMake 4.0 或更高版本
- C++20 兼容的编译器（GCC 10+, Clang 10+, MSVC 2019+）
- Git

### 使用步骤

1. **克隆或使用此模板创建新项目**

   ```bash
   git clone <your-repo-url>
   cd <project-name>
   ```

2. **配置项目名称**

   手动替换文件中的 `vcpkg-template`：

   ```bash
   # 使用 sed 替换（Linux/macOS）
   find . -type f -name "*.cmake" -o -name "*.json" -o -name "README.md" -o -name "CMakeLists.txt" | \
     xargs sed -i '' 's/vcpkg-template/your-project-name/g'
   ```

3. **添加依赖**

   编辑 `vcpkg.json` 文件，添加你需要的依赖包：

   ```json
   {
     "dependencies": [
       "fmt",
       "spdlog",
       "catch2"
     ]
   }
   ```

4. **构建项目**

   ```bash
   mkdir build
   cd build
   cmake ..
   cmake --build .
   ```

5. **运行程序**

   ```bash
   ./vcpkg-template  # Linux/macOS
   # 或
   .\vcpkg-template.exe  # Windows
   ```

## 项目结构

```
.
├── CMakeLists.txt          # CMake 主配置文件
├── vcpkg.json              # vcpkg 依赖声明文件
├── main.cpp                # 主程序入口
├── cmake/
│   └── ProjectVcpkg.cmake # vcpkg 自动配置脚本
├── LICENSE                 # Apache 2.0 许可证
└── README.md               # 本文件
```

## 配置说明

### CMakeLists.txt

- `CMAKE_CXX_STANDARD`: 设置为 C++20
- `VERSION`: 项目版本号
- `URL_BASE`: vcpkg 仓库地址（默认为 github.com，可自定义）

### vcpkg.json

vcpkg 的依赖清单文件。添加依赖时，只需在 `dependencies` 数组中添加包名：

```json
{
  "dependencies": [
    "package-name",
    {
      "name": "package-name",
      "version": ">=1.0.0"
    }
  ]
}
```

### ProjectVcpkg.cmake

自动下载和配置 vcpkg 的脚本。默认使用 vcpkg 的特定版本（2026.01.16），确保构建的可重复性。

## 添加依赖示例

### 示例 1: 添加 fmt 库

编辑 `vcpkg.json`：

```json
{
  "dependencies": [
    "fmt"
  ]
}
```

在 `main.cpp` 中使用：

```cpp
#include <fmt/core.h>

int main() {
    fmt::print("Hello, {}!\n", "World");
    return 0;
}
```

在 `CMakeLists.txt` 中链接：

```cmake
find_package(fmt CONFIG REQUIRED)
target_link_libraries(vcpkg-template PRIVATE fmt::fmt)
```

### 示例 2: 添加 spdlog 日志库

编辑 `vcpkg.json`：

```json
{
  "dependencies": [
    "spdlog"
  ]
}
```

在代码中使用：

```cpp
#include <spdlog/spdlog.h>

int main() {
    spdlog::info("Hello, {}!", "World");
    return 0;
}
```

在 `CMakeLists.txt` 中链接：

```cmake
find_package(spdlog CONFIG REQUIRED)
target_link_libraries(vcpkg-template PRIVATE spdlog::spdlog)
```

## 常见问题

### Q: vcpkg 下载很慢怎么办？

A: 可以通过设置 `URL_BASE` 环境变量使用镜像源：

```bash
cmake -DURL_BASE=gitee.com/mirrors ..
```

### Q: 如何更新 vcpkg 版本？

A: 编辑 `cmake/ProjectVcpkg.cmake` 文件，修改 `GIT_TAG` 为所需的版本标签。

### Q: 依赖安装在哪里？

A: 依赖会被下载到项目目录下的 `deps/` 文件夹中（已在 `.gitignore` 中排除）。

### Q: 如何在 CLion 中使用？

A: CLion 会自动识别 CMake 项目。打开项目后，CLion 会提示配置 CMake，使用默认配置即可。vcpkg 会自动通过 FetchContent 下载。

## 开发建议

1. **使用现代 CMake 方式链接库**

   推荐使用 `find_package()` 和 `target_link_libraries()`，而不是直接使用 `include_directories()` 和 `link_directories()`。

2. **版本锁定**

   vcpkg 的版本在 `ProjectVcpkg.cmake` 中锁定，确保团队使用相同版本的 vcpkg。

3. **依赖管理**

   在 `vcpkg.json` 中明确声明所有依赖，避免隐式依赖。

## 许可证

本项目使用 Apache License 2.0 许可证。详见 [LICENSE](LICENSE) 文件。

## 贡献

欢迎提交 Issue 和 Pull Request！

## 相关资源

- [vcpkg 官方文档](https://vcpkg.io/)
- [CMake 官方文档](https://cmake.org/documentation/)
- [vcpkg 包列表](https://vcpkg.io/en/packages.html)
