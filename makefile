CC = gcc
SRC_DIR = src
BUILD_DIR = build

# 第一行写上所有的伪目标（别名），告诉 make 它们不是真实的文件
.PHONY: all clean hello world

# 默认目标：敲 make 就编译所有东西  @表示不在终端输出这条执行语句
all: hello world
	@echo "All targets built successfully!"

# --- 核心马甲区（别名映射） ---
# 当你在终端敲 make hello 时，它知道真正要干活的是 $(BUILD_DIR)/hello
hello: $(BUILD_DIR)/hello
world: $(BUILD_DIR)/world

# --- 实际干活的规则区 ---
$(BUILD_DIR)/hello $(BUILD_DIR)/world: $(BUILD_DIR)/main.o $(BUILD_DIR)/message.o
	$(CC) $^ -o $@

# 万能模具：如何把 .c 变成 .o
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) -c $^ -o $@

clean:
	rm -f $(BUILD_DIR)/*