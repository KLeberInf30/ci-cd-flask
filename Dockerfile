# Imagem base: Python enxuto
FROM python:3.12-slim

# Variáveis de ambiente para evitar problemas de cache e logs
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Definindo diretório de trabalho dentro do container
WORKDIR /app

# Copia dependências e instala
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código
COPY . .

# Expõe a porta da aplicação
EXPOSE 8000

# Define como o container será iniciado
CMD ["gunicorn", "-w", "2", "-b", "0.0.0.0:8000", "app:app"]
