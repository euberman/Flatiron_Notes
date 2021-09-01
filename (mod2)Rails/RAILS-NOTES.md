
# Active Record ASSOCIATION Notes


# ============================================================
## AUTO-GENERATED METHODS
# ============================================================

_________________________________________________________________________
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## ONE-TO-MANY / MANY-TO-MANY
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	## Collection associations (one-to-many / many-to-many)
		                                  |       |          | has_many
		generated methods                 | habtm | has_many | :through
		----------------------------------+-------+----------+----------
		others                            |   X   |    X     |    X
		others=(other,other,...)          |   X   |    X     |    X
		other_ids                         |   X   |    X     |    X
		other_ids=(id,id,...)             |   X   |    X     |    X
		others<<                          |   X   |    X     |    X
		others.push                       |   X   |    X     |    X
		others.concat                     |   X   |    X     |    X
		others.build(attributes={})       |   X   |    X     |    X
		others.create(attributes={})      |   X   |    X     |    X
		others.create!(attributes={})     |   X   |    X     |    X
		others.size                       |   X   |    X     |    X
		others.length                     |   X   |    X     |    X
		others.count                      |   X   |    X     |    X
		others.sum(*args)                 |   X   |    X     |    X
		others.empty?                     |   X   |    X     |    X
		others.clear                      |   X   |    X     |    X
		others.delete(other,other,...)    |   X   |    X     |    X
		others.delete_all                 |   X   |    X     |    X
		others.destroy(other,other,...)   |   X   |    X     |    X
		others.destroy_all                |   X   |    X     |    X
		others.find(*args)                |   X   |    X     |    X
		others.exists?                    |   X   |    X     |    X
		others.distinct                   |   X   |    X     |    X
		others.reset                      |   X   |    X     |    X
		others.reload                     |   X   |    X     |    X

	HAS_MANY - SCOPE EXAMPLES
		has_many :comments, -> { where(author_id: 1) }
		has_many :employees, -> { joins(:address) }
		has_many :posts, ->(blog) { where("max_post_length > ?", blog.max_post_length) }
	HAS_MANY - OPTION EXAMPLES
		has_many :comments, -> { order("posted_on") }
		has_many :comments, -> { includes(:author) }
		has_many :people, -> { where(deleted: false).order("name") }, class_name: "Person"
		has_many :tracks, -> { order("position") }, dependent: :destroy
		has_many :comments, dependent: :nullify
		has_many :tags, as: :taggable
		has_many :reports, -> { readonly }
		has_many :subscribers, through: :subscriptions, source: :user


	HAS_AND_BELONGS_TO_MANY - SCOPE EXAMPLES
		has_and_belongs_to_many :projects, -> { includes(:milestones, :manager) }
		has_and_belongs_to_many :categories, ->(post) { where("default_category = ?", post.default_category) }
	HAS_AND_BELONGS_TO_MANY - OPTION EXAMPLES
		has_and_belongs_to_many :projects
		has_and_belongs_to_many :projects, -> { includes(:milestones, :manager) }
		has_and_belongs_to_many :nations, class_name: "Country"
		has_and_belongs_to_many :categories, join_table: "prods_cats"
		has_and_belongs_to_many :categories, -> { readonly }


_________________________________________________________________________
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	## ONE-TO-ONE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	## Singular associations (one-to-one)
		                                  |            |  belongs_to  |
		generated methods                 | belongs_to | :polymorphic | has_one
		----------------------------------+------------+--------------+---------
		other                             |     X      |      X       |    X
		other=(other)                     |     X      |      X       |    X
		build_other(attributes={})        |     X      |              |    X
		create_other(attributes={})       |     X      |              |    X
		create_other!(attributes={})      |     X      |              |    X
		reload_other                      |     X      |      X       |    X

	HAS_ONE - SCOPE EXAMPLES
		has_one :author, -> { where(comment_id: 1) }
		has_one :employer, -> { joins(:company) }
		has_one :latest_post, ->(blog) { where("created_at > ?", blog.enabled_at) }
	HAS_ONE - OPTION EXAMPLES
		has_one :credit_card, dependent: :destroy  # destroys the associated credit card
		has_one :credit_card, dependent: :nullify  # updates the associated records foreign key value to NULL rather than destroying it
		has_one :last_comment, -> { order('posted_on') }, class_name: "Comment"
		has_one :project_manager, -> { where(role: 'project_manager') }, class_name: "Person"
		has_one :attachment, as: :attachable
		has_one :boss, -> { readonly }
		has_one :club, through: :membership
		has_one :primary_address, -> { where(primary: true) }, through: :addressables, source: :addressable
		has_one :credit_card, required: true