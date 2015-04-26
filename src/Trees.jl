# Tree data type used for a routing tree.
type Tree
    value::Any
    children::Array{Tree,1}
end
Tree(value::Any) = Tree(value, Tree[])

function ischild(element, tree::Tree)
    for child in tree.children
        if isequal(child.value, element)
            return true
        end
    end
    return false
end

function getchild(tree::Tree, element)
    for child in tree.children
        if isequal(child.value, element)
            return child
        end
    end
end

function insert!(tree::Tree, values::Array)
    if isempty(values)
        tree
    elseif length(values) == 1
        # for last value,
        # if it has already in the tree.children, update it with the last value
        # if it is not in the tree.children, push it in the tree.children.
        leaf = Tree(values[1])

        i = findfirst((t) -> isequal(t.value, leaf.value), tree.children)

        if i != 0 # the leaf has already in the tree.children, replace it
            tree.children[i] = leaf
        else
            push!(tree.children, leaf)
        end
    elseif ischild(values[1], tree)
        t = getchild(tree, values[1])
        insert!(t, values[2:end])
    else
        t = Tree(values[1])
        insert!(t, values[2:end])
        push!(tree.children, t)
    end
end

abstract SearchStrategy

type DFS <: SearchStrategy end

type PRUNE end

function search(tree::Tree, pred::Function)
    action = pred(tree.value)
    if action == true
        tree.value
    elseif action == PRUNE
        nothing
    else
        for child in tree.children
            val = search(child, pred)
            if val != nothing
                return val
            end
        end
        nothing
    end
end
