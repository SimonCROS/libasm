#include <stdio.h>
#include <string.h>

#include "libasm.h"

int	main(void)
{
	char	*str;
	char	buf[100];

	str = "Bonjour !";
	printf("%zu\n", strlen(str));
	printf("%zu\n", ft_strlen(str));

	strcpy(buf, str);
	printf("%s\n", buf);
	strcpy(buf, "aaaaaaaaaaaaaaaaaaaaaaaaa");
	ft_strcpy(buf, str);
	printf("%s\n", buf);
	return (0);
}
