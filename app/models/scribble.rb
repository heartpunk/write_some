class Scribble < ActiveRecord::Base
  has_many :revisions

  after_save :append_revision

  def text
    (revisions.last || Revision.new).text
  end

  def text= new_text
    @new_revision = Revision.create text: new_text
  end

  private

  def append_revision
    revisions << @new_revision
  end
end
