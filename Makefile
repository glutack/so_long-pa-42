#---------- ----------#
NAME	=	so_long
SRC		=	main.c images.c keys.c check_map.c player.c check_other.c move_enemy.c errors.c map.c animation.c
OBJ		=	$(SRC:.c=.o)

#--------- library ---------#
LIBFT		=	./libft/libft.a
LIBMLX		=	./mlx/libmlx.a

#---------- other ----------#
CFLAGS	=	-Wall -Wextra -Werror
RM		=	rm -f

#---------- rules ----------#

all: $(NAME) 

$(LIBFT):
	@make -C ./libft

$(LIBMLX):
	@make -C ./mlx

%.o: %.c
	@gcc $(CFLAGS) -c $(SRC)
	@echo "Objetos creados :D"

$(NAME): $(OBJ) $(LIBMLX) $(LIBFT)
	@gcc $(OBJ) -Llibft -lft -Lmlx -lmlx -framework OpenGL -framework AppKit -o $(NAME)
	@echo "Juego creado :D"

clean:
	@$(RM) $(OBJ)
	@echo "Objetos eliminados :D"

fclean: clean
	@$(RM) $(NAME)
	@echo "Juego eliminado :D"

re: fclean all

libclean:
	@make -C ./mlx clean
	@make -C ./libft fclean
	@echo "Objetos de las librerías eliminados :D"

.PHONY: all clean fclean re