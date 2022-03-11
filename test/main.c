#include <stdio.h>
#include <string.h>

#include "libasm.h"

int	main(void)
{
	{
		char *str = "Hello World!";
		size_t len;

		len = strlen(str);
		printf("%zu (%s)\n", len, str);
		len = ft_strlen(str);
		printf("%zu (%s)\n", len, str);
	}
	{
		char *str = "Hello World!";
		char buf[100];
		char *ret;

		memset(buf, 42, 100);
		ret = strcpy(buf, str);
		printf("buf %p = %s | src %p = %s | dst %p = %s\n", buf, buf, str, str, ret, ret);

		memset(buf, 42, 100);
		ret = ft_strcpy(buf, str);
		printf("buf %p = %s | src %p = %s | dst %p = %s\n", buf, buf, str, str, ret, ret);
	}
	return (0);
}
