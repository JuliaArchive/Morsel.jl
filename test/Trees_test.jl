module TreesTest
using FactCheck
include("../src/Trees.jl")

facts("Tree") do
    context("ischild") do
        t = Tree(:root)
        insert!(t, [:a, :b, :c])

        @fact ischild(:a, t) => true

        @fact ischild(:b, t) => false
        @fact ischild(:c, t) => false
        @fact ischild(:d, t) => false
    end
end

end
