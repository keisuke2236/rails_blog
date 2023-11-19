json.id @article.id
json.title @article.title
json.date @article.date.strftime('%Y-%m-%d')
json.tags @article.tags
json.author @article.author
json.slide @article.slide
json.contentHtml @article.content
