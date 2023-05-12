# demo-deploy
## Проект Terraform для развертывания рабочих мест для демонстрационного экзамена
Для работы с проектом, необходимо установить на свою машину Terraform, а так же иметь VPN подключение к серверу в другой стране (это необходимо для того, чтобы установить провайдер OpenNebula)

Когда весь софт установлен, нужно клонировать себе этот репозиторий и затем ввести эти команды:

```terraform init```

```terraform plan```

```terraform apply```

На всякий случай, для проверки кода перед инитом можно ввести

```terraform validate```

\
Если нужно запустить отдельные модули или ресурсы,то пишем следующее

#для модулей\
```terraform apply -target=module.workplaces```

#для ресурсов\
```terraform apply -target=opennebula_host.node-1```