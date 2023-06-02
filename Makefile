# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nrossa <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/08 12:54:21 by nrossa            #+#    #+#              #
#    Updated: 2023/06/02 05:50:15 by nrossa           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: clean fclean norme

NAME = libft.a

CC = gcc
CFLAGS = -Wall -Wextra -Werror
AR = ar rcs
RM = /bin/rm -f

HDR = libft.h
SRC = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c ft_toupper.c ft_tolower.c \
ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_memchr.c ft_memcmp.c \
ft_strlen.c ft_strlcpy.c ft_strlcat.c ft_strchr.c ft_strrchr.c ft_strncmp.c ft_strnstr.c ft_atoi.c ft_itoa.c ft_utoa.c \
ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_strmapi.c ft_striteri.c \
ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_putncount.c \
ft_lstnew.c ft_lstadd_front.c ft_lstadd_back.c ft_lstsize.c ft_lstlast.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c ft_lstmap.c \
get_next_line.c get_next_line_utils.c \
ft_printf.c ft_printf_chara.c ft_printf_digit.c ft_printf_hexa.c ft_printf_ptr.c ft_printf_flags.c ft_printf_utils.c
OBJS = $(SRC:.c=.o)

BLACK = \033[30m
RED = \033[31m
GREEN = \033[32m
YELLOW = \033[33m
BLUE = \033[34m
WHITE = \033[37m
NC = \033[0m

.c.o:
	@$(CC) $(CFLAGS) -c $< -o $(<:.c=.o)

$(NAME): $(OBJS)
	@echo "$(RED)Compilation in progress...$(NC)"
	@$(AR) $(NAME) $(OBJS)
	@echo "$(GREEN)Compilation complete !$(NC)"

all: $(NAME)

clean:
	@echo "$(YELLOW)Cleaning object files...$(NC)"
	@$(RM) $(OBJS)
	@echo "$(GREEN)Cleaning complete !$(NC)"

fclean: clean
	@echo "$(YELLOW)Cleaning libft library...$(NC)"
	@$(RM) $(NAME)
	@echo "$(GREEN)Cleaning complete !$(NC)"

re: fclean all

norme:
	@echo "$(YELLOW)Checking Norme...$(NC)"
	@norminette $(SRC) $(HDR)
	@echo "$(GREEN)Checking complete !$(NC)"
