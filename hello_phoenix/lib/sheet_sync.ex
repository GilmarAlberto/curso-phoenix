defmodule SheetSync do
  @file_id "1cURVLcyVmEh7WUwyGMFDfDso6AcVQnf7ezh5aZ72_BQ"
  @export_url "https://docs.google.com/spreadsheets/d/#{@file_id}/export?format=xlsx"
  @filename "Tarefas do Projeto Phoenix.xlsx"

  def fetch_and_push(repo_path \\ ".") do
    repo_path = Path.expand(repo_path)

    case Req.get(@export_url, follow_redirects: true, receive_timeout: 60_000) do
      {:ok, %Req.Response{status: 200, body: body}} ->
        target = Path.join(repo_path, @filename)
        File.write!(target, body, [:binary])
        commit_if_changed(repo_path, @filename)

      {:ok, %Req.Response{status: status}} ->
        IO.puts("Falha ao baixar (status #{status}). Verifique o link.")
      {:error, reason} ->
        IO.inspect(reason, label: "Erro HTTP")
    end
  end

  defp commit_if_changed(repo_path, filename) do
    {porcelain, _} = System.cmd("git", ["status", "--porcelain", filename], cd: repo_path)

    if String.trim(porcelain) == "" do
      IO.puts("Nenhuma alteração no arquivo — nada a commitar.")
    else
      System.cmd("git", ["add", filename], cd: repo_path)
      System.cmd("git", ["commit", "-m", "Atualiza planilha: #{Date.utc_today()}"], cd: repo_path)
      System.cmd("git", ["push"], cd: repo_path)
      IO.puts("Arquivo atualizado e enviado ao remoto.")
    end
  end
end

