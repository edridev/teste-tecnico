class Dijkstra
  # Limite para um Integer (supondo que seja o infinito)
  INFINITE = 2_147_483_647 / 2

  def initialize
    @edges = {}
    @nodes = []
  end

  def add_pair(first_node, second_node, cost)
    # adiciona pares (arestas e seus respectivos pesos)
    @edges["#{first_node}-->#{second_node}"] = cost

    # adiciona lista de vértices
    @nodes << first_node unless @nodes.include? first_node
    @nodes << second_node unless @nodes.include? second_node
  end

  # using Dijkstra algorithm
  def run(source, target)
    check_node source, target

    values = {}
    visited_list = []
    @nodes.each { |elem| values[elem] = INFINITE }

    visited_node = nil
    values[source] = 0

    min_value = lambda {
      values.reject { |k, _| visited_list.include? k }.min_by { |_k, v| v }[0]
    }

    @nodes.each do |_|
      node_ref = visited_node || source
      @nodes.each do |key|
        key_value = get_cost(node_ref, key)
        if !visited_list.include?(key) && key != node_ref && !key_value.nil?
          new_value = values[node_ref] + key_value
          values[key] = new_value if new_value < values[key]
        end

        next unless key == target

        next unless target == min_value.call

        return {
          route: build_route(values, target, [target]).reverse.join(' --> '),
          cost: values[key]
        }
      end
      visited_list << visited_node = min_value.call
    end
    {
      route: build_route(values, target, [target]).reverse.join(' --> '),
      cost: values[visited_node]
    }
  end

  private

  def get_cost(source, target)
    @edges["#{source}-->#{target}"] || @edges["#{target}-->#{source}"]
  end

  def build_route(values, target, route)
    get_adjacencies(target).each do |adj|
      next unless values[target] - values[adj] == get_cost(target, adj)

      route = build_route(values, adj, route << adj)
      break
    end
    route
  end

  def get_adjacencies(node)
    @edges.keys.select { |elem| elem.split('-->').include?(node) }.map do |key|
      keys = key.split('-->')
      keys[0] == node ? keys[1] : keys[0]
    end.uniq
  end

  # Testa o vértice
  def check_node(node_a, node_b)
    raise "#{node_a} is invalid node." unless @nodes.include?(node_a)
    raise "#{node_b} is invalid node." unless @nodes.include?(node_b)
  end
end
