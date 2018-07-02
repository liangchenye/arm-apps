# arm-apps

本项目收集运行于ARM平台的容器镜像.
所有的镜像都要求:可追溯\可运行\可验证.
`template`目录下提供文档模板.

## 镜像分类
### 原则
- 本项目只收纳开源的镜像
- 本项目不接收恶意（挖矿等）的镜像 
- 引自社区的代码、文档标准对应的源地址和协议

### 基础镜像
由于社区有使用不同基础镜像的需求,因此在本项目里面专门提供`base-images`目录.
base-images直接来自上游社区，遇到相关问题建议参考对应镜像的README.md里面`支持`部分内容。

### 应用镜像
TODO: 增加分组管理

## 提交者指南
### 如何提交新镜像
- [提交issue](github.com/isula/arm-apps/issues/new)
  同时,每个镜像都要求有对应issue,记录需求来源
- [提交PR](github.com/isula/arm-apps/pulls)
  在arm-apps下面建立子目录,子目录里面文档参考template
- 验证,合并PR
- dockerhub上面发布   

### 版本命名规则
docker镜像在17.06版本之后天生支持多架构形式。
目前为了和旧版本兼容，命名规则为 `$name-arm64:$version`.
比如说 `demo-arm64:0.1`.


## 管理者指南
### 项目治理标签
- 对于本项目管理规则的建议、问题，设置 `governance`

### 需求标签 
- 对于尚未确认的，设置 `under discussion`；一旦需求确定，取消
- 对于需求确认的，设置 `task accepted`
  同时，将 template/Issue.md 里面内容添加到issue里面作为跟踪.
  模板里面任务完成后，关闭。
- 对于高优先级，设置`high priority`
- 对于某镜像更新的需求，设置`update request`。
  同样将 template/Issue.md 里面的内容添加到issue里面作为跟踪。
- 对于和原则不一致的镜像，设置为 `invalid` 然后经过问题提交者同意后关闭。

### 问题标签
- 对于镜像功能问题，设置 `bug`
- 对于使用、文档等问题，设置为 `question`
- 对于超出维护能力的高级问题，设置为`help wanted`


## 其他
当前用中文作为主要的描述语言.

