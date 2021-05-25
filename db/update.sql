-- 更新历史菜单排序避免空指针
UPDATE `sys_menu` SET `sort`=1 WHERE ISNULL(`sort`)
