# Bash AI

Bash AI _(bai)_ is a bash shell script that acts as an AI assistant, inspired by [Your AI _(yai)_](https://github.com/ekkinox/yai).\
Leveraging OpenAI's capabilities, it allows you to ask questions and perform terminal-based tasks using natural language. It provides answers and command suggestions based on your input and allows you to execute or edit the suggested commands if desired.

## Features

Bash AI offers the following features:

- **Natural Language Interface**\
	Communicate with the terminal using everyday language.
	
- **Question Answering**\
	Get answers to all your terminal questions by ending your request with a question mark.

- **Command Suggestions**\
	Receive intelligent command suggestions based on your input.

- **Command Information**\
	Get detailed information about the suggested commands.
	
- **Distribution Awareness**\
	Get answers and commands that are compatible with, and related to, your specific Linux distribution.

- **Command Execution**\
	Choose to execute the suggested commands directly from Bash AI.

- **Command Editing**\
	Edit the suggested commands before execution.

## Installation

All you have to do is run the Bash AI script to get started.

1. Clone the repository:

	```bash
	git clone https://github.com/hezkore/bash-ai.git
	```
2. Make the script executable:

	```bash
	chmod +x bai.sh
	```

3. Execute Bash AI:

	```bash
	./bai.sh
	```

*  _(Optional)_ For convenience, create an alias for the `bai.sh` script in your `.bashrc` file:

	```conf
	alias bai='path/to/bai.sh'
	```
Please replace `path/to/bai.sh` with the actual path to the `bai.sh` script. This step allows you to execute the script using the `bai` command, reducing the need for typing the full path to the script each time.

## Configuration

On the first run, a configuration file named `bai.cfg` will be created in your `~/.config` directory.\
You must provide your OpenAI key in the `key=` field of this file. The OpenAI key can be obtained from your OpenAI account.

> [!CAUTION]
> Keeping the key in a plain text file is dangerous, and it is your responsibility to keep it secure.

You can also change the model, temperature and query in this file.

> [!TIP]
> The `gpt-4` models produce much better results than the standard `gpt-3.5-turbo` model.

## Usage

Run `bai your request here` _(or `./bai.sh your request here` if you didn't add `bai` as an alias in your bashrc file)_ and Bash AI will return a command suggestion for your request.\
For example:

```
bai create a new directory with a name of your choice, then create a text file inside it
```

You can also ask questions by ending your request with a question mark:

```
bai what is the current time?
```

You can also simply run `bai` _(or `./bai.sh` if you didn't add `bai` as an alias in your bashrc file)_ without any request to enter Interactive Mode.

## Prerequisites

- [OpenAI account and API key](https://platform.openai.com/apps)
- [curl](https://curl.se/download.html)
- [jq](https://stedolan.github.io/jq/download/)

## Known Issues

- Single quotes will cause your request to fail outside of Interactive Mode.\
	For example, `./bai.sh what's the current time?` will fail, but both `./bai.sh whats the current time?` and `./bai.sh what is the current time?` will succeed.\
	This is a limitation of the terminal, not present when using `bai` in Interactive Mode.