defmodule Shopify.Product do
  @derive [Poison.Encoder]
  @singular "product"
  @plural "products"

  use Shopify.Resource,
    import: [:find, :all, :count, :create, :update, :delete]

  alias Shopify.{Product, Variant, Image, Option}

  defstruct [
    :body_html,
    :created_at,
    :handle,
    :id,
    :images,
    :options,
    :product_type,
    :published_at,
    :published_scope,
    :tags,
    :template_suffix,
    :title,
    :metafields_global_title_tag,
    :metafields_global_description_tag,
    :updated_at,
    :variants,
    :vendor
  ]

  def empty_resource do
    %Product{
      variants: [%Variant{}],
      images: [%Image{}],
      options: [%Option{}]
    }
  end

  def find_url(id), do: @plural <>  "/#{id}.json"

  def all_url, do: @plural <> ".json"

  def count_url, do: @plural <> "/count.json"
end