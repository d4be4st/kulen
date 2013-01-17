class JqueryFileTree
  
  def initialize(root)
    @root = root
  end

  def dirs(path=".")
    path = "" if path.nil?
    @path = File.join(File.expand_path(@root), path)
    @dirs = []
    if File.exists?(@path)
      Dir.entries(@path).each do |dir|
        if File.directory?(File.join(@path, dir)) && dir[0,1]!="."
          @dirs << dir
        end
      end
    end
    @dirs
  end

  def files(path=".")
    path = "" if path.nil?
    @path = File.join(File.expand_path(@root), path)
    @files = []
    if File.exists?(@path)
      Dir.entries(@path).each do |file|
        if File.file?(File.join(@path, file)) && file!="meta.yml"
          @files << file
        end
      end
    end
    @files
  end

  def content(path=".")
      [dirs(path), files(path)]
  end
end