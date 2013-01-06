class Scribble < ActiveRecord::Base
  default_scope order: 'created_at desc'

  has_many :revisions

  after_save :append_revision
  before_destroy :delete_revisions

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

  def delete_revisions
    revisions.each do |revision|
      revision.destroy!
    end
  end
end
