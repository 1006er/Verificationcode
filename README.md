# Verificationcode 项目基于openresty lua开发
## 架构图
![image](https://img2.imgtp.com/2024/02/17/66de4kch.png)

## 接口
采用HTTP get 方式访问。
### /get_id 
用于生成并且返回验证码，调用creat_id.lua生成验证码以及redis_connect连接redis数据库，然后将验证码写入数据库中，然后设置超时时间。返回验证码。

### /verify_id
用于验证验证码准确性，通过get中id参数获取验证码。然后访问redis查询验证码是否有效，返回验证结果。
