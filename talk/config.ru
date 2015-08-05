use Rack::Static,
  :urls => ["/images", "/js", "/css"],
  :root => "public"

run lambda { |env|
  @slide_content = File.wait_if_presenting('./slides.md')
  [
    200,
    {
      'Content-Type'  => 'text/html',
      'Cache-Control' => 'public, max-age=86400'
    },
    [ERB.new(File.wait_if_presenting('./slides.html')).result(binding)]
  ]
}
