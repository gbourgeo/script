#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gbourgeo <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/05/23 22:20:08 by gbourgeo          #+#    #+#              #
#    Updated: 2020/09/08 14:42:26 by gbourgeo         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = ft_script

SRC_DIR = src/
SRC = main.c \
	ft_env.c \
	ft_error.c \
	ft_execve.c \
	ft_fork.c \
	ft_get_path.c \
	ft_start_script.c \
	ft_term.c

OBJ_DIR = obj/

OBJ = $(addprefix $(OBJ_DIR), $(SRC:.c=.o))

LIBFT = libft

HEADERS = -I include -I $(LIBFT)/includes

LIBS = -L $(LIBFT) -lft

CC = gcc
CFLAGS = -Wall -Werror -Wextra

all: lib $(OBJ_DIR) $(NAME)

lib:
	@make -C $(LIBFT)

$(OBJ_DIR):
	@mkdir -p $@

$(NAME): $(OBJ)
	$(CC) -o $@ $^ $(LIBS)

$(OBJ_DIR)%.o: $(SRC_DIR)%.c
	$(CC) $(CFLAGS) -o $@ -c $< $(HEADERS)

clean:
	@make -sC $(LIBFT) clean
	@/bin/rm -rf $(OBJ_DIR)

fclean: clean
	@make -sC $(LIBFT) fclean
	@/bin/rm -f $(NAME)

re: fclean all

.PHONY: lib $(OBJ_DIR) clean fclean re all
