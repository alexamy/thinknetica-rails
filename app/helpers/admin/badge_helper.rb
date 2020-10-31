module Admin::BadgeHelper
  PLACEHOLDER = '-'

  def badges_for_select
    Badge.filenames.map do |filename|
      [filename, filename, { 'data-image-path': image_path("badges/#{filename}.svg") }]
    end
  end

  def sprite_for(filename, options = {})
    options[:size] ||= '50px * 50px'

    inline_svg_tag "badges/#{filename}.svg", options
  end

  def condition(badge)
    send(badge.rule, badge) || PLACEHOLDER
  end

  def level(badge)
    badge.rule == 'level' && badge.condition.to_i
  end

  def category(badge)
    badge.rule == 'category' && Category.find(badge.condition).name
  end

  def first_try(badge)
    badge.rule == 'first_try' && Test.find(badge.condition).title
  end
end
