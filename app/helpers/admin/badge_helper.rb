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

  def level(badge)
    badge.level.positive? ? badge.level : PLACEHOLDER
  end

  def category(badge)
    badge.category&.name || PLACEHOLDER
  end

  def test_first_try(badge)
    badge.test_first_try&.title || PLACEHOLDER
  end
end
