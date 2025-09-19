# Projeto: Sistema de Gestão para Chácara de Morangos

**Objetivo:** Criar um sistema completo em Elixir/Phoenix para gerenciar a produção, estoque, vendas, manutenção e monitoramento da chácara, acessível **tanto no notebook quanto no celular**, com integração ao **WhatsApp** para envio de confirmações e alertas.

---

## Funcionalidades

### 1. Sistema de Gestão de Produção
- Registro de datas de plantio e colheita.
- Previsão de safra.
- Controle de estoque (quantidade colhida, vendida, descartada).
- Relatórios para identificar períodos de maior produção.

### 2. Controle Financeiro Simples
- Registro de custos (insumos, manutenção, mão de obra).
- Registro de vendas e cálculo automático de lucro líquido.

### 3. Agenda de Manutenção e Cuidados
- Notificações sobre irrigação, adubação e pulverização.
- Registro de tarefas e histórico de manutenção.

### 4. Monitoramento de Clima
- Integração com APIs meteorológicas.
- Alertas automáticos sobre geadas, chuvas fortes ou ondas de calor.
- Possibilidade de envio de notificações para celular, e-mail ou WhatsApp.

### 5. App ou Painel para Vendas Diretas
- Registro automático de pedidos de clientes.
- Confirmação de pedidos via WhatsApp.
- Histórico de vendas e clientes.

---

## Tecnologias e Recursos
- **Elixir/Phoenix**: Backend e lógica de negócios.
- **Phoenix LiveView**: Interface web reativa e em tempo real.
- **Banco de dados (PostgreSQL)**: Armazenamento de dados de produção, vendas e manutenção.
- **Integração com APIs externas**: Clima e notificações.
- **Integração com WhatsApp**: Confirmação de pedidos e alertas.
- **Responsividade (Mobile e Desktop)**: Acesso tanto em notebook quanto em celular, com opção futura de PWA.

---
:
## Estrutura do Projeto (sugestão)
- **lib/** → Módulos principais (Produção, Financeiro, Vendas, Manutenção, Clima)  
- **lib/app_web/** → Controllers, Views, Templates, LiveViews  
- **priv/repo/** → Migrations e seeds do banco  
- **assets/** → Frontend (JS, CSS, imagens)  
- **routes.ex** → Rotas principais (dashboard, produção, estoque, vendas, manutenção)  

---

## Próximos Passos
1. Criar o esqueleto do projeto Phoenix.
2. Definir schemas e migrations para produção, estoque, vendas e manutenção.
3. Criar páginas e dashboards básicos usando LiveView.
4. Implementar integração com API de clima e alertas.
5. Implementar integração com WhatsApp para confirmações de pedidos.
6. Garantir que o sistema seja responsivo para notebook e celular.
7. Testar o sistema com dados simulados da chácara.

---

**Observação:** Este projeto é um protótipo inicial que pode ser expandido conforme a necessidade da chácara, incluindo mais automações, relatórios avançados e integração com dispositivos IoT no futuro.

