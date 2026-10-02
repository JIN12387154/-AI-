# 地球智能 SKILL

一套内置在 AI 助手里的商业与内容工具箱，共 34 个技能，装完后直接用自然语言对话即可，不用记命令。

## 能力覆盖

- 商业模式诊断、找对标、JTBD 任务澄清
- 口播稿 / 短视频脚本优化、开头钩子、完播率流失点检查
- 小红书标题、稿件共鸣诊断、传播机制解读
- 发布前敏感词与违规排雷、AI 味检测
- 决策记录、目标拆解、概念拆解、理论溯源
- 学习计划、本地知识库、短视频链接取稿
- 微信公众号 HTML 排版

## 安装

### Windows（推荐）

1. 从 [Releases](../../releases) 下载最新的 `地球智能SKILL-安装包.zip`
2. 解压到一个固定位置
3. 双击 `安装.bat`
4. 完全关闭并重启豆包 / Claude / Cursor

### Mac

```bash
unzip 地球智能SKILL-安装包.zip
cd 地球智能SKILL-安装包
bash install.sh
```

### 从源码安装（开发者）

```bash
git clone https://github.com/JIN12387154/-AI-.git
cp -r skills/* ~/.claude/skills/
```

## 使用

装完后直接对 AI 说人话，比如：

- "帮我看看这个口播稿顺不顺，哪里会划走"
- "这个小红书标题帮我起 5 个"
- "我这生意帮我诊断一下问题出在哪"

AI 会自动判断该用哪个技能并直接开干。

## 致谢

本项目基于开源项目 [dontbesilent2025/dbskill](https://github.com/dontbesilent2025/dbskill) 二次定制，原作者版权归原作者所有。详见 [CREDITS.md](./CREDITS.md)。
