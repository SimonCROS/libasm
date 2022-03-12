LINUX				:= 0

# Folders

override BIN		:= bin
override SRC		:= src
override INC		:= includes

# Properties

NAME			= libasm.a

# Commands

override AR		:= ar rcs

override NASM		:= nasm
override SFLAGS		:= -f macho64

override CC		:= gcc
override CFLAGS		:= 
override INCLUDES	:= -I$(INC)

override RM			:= rm -rf

# Sources

override SRCS		:=			\
				ft_strcpy.s	\
				ft_strlen.s	\
				ft_strcmp.s	\
				ft_write.s	\
				ft_read.s	\
				ft_strdup.s	\

override OBJS		:= $(addprefix $(BIN)/, $(SRCS:.s=.o))

all:		$(NAME)

$(BIN)/%.o:	$(SRC)/%.s
			@mkdir -p $(dir $@);
			$(NASM) $(SFLAGS) $< -o $@

$(NAME):	$(OBJS)
			ar rcs $@ $?

clean:
			$(RM) $(OBJS)
			find $(BIN) -type d -empty -delete

fclean:		clean
			$(RM) $(NAME)

re:			fclean all

.PHONY:		all clean fclean re
