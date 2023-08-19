module Graphs
  class Dijkstra
    # Limite para um Integer (supondo que seja o infinito)
    INFINITE = 2_147_483_647 / 2

    def initialize
      @reversed = false
      @nodes = []

      data = YAML.load(File.open(Rails.root.join('config', 'vagas.yml')))['graph']
      @edges = data['edges']
      @nodes = data['nodes']
    end

    # using Dijkstra algorithm
    def run(source, target)
      check_node source, target

      @reversed = target > source
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

          return build_return(values, key, target)
        end
        visited_list << visited_node = min_value.call
      end
      build_return(values, visited_node, target)
    end

    private

    def build_return(values, current, target)
      route = build_route(values, target, [target])
      {
        route: route.reverse.join(' --> '),
        cost: values[current]
      }
    end

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
end
