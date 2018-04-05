
# Learning a New Programming Language: Ruby
# by Alds Hade, ID# 11789190
puts "\nLearning a New Programming Language: Ruby"
puts "by Alds Hade, ID\# 11789190"

# Top-down merge sort function.
# Time complexity: on average O(nlogn); at worst O(nlogn)
# Space complexity: at worst O(n)
# @params array to be sorted
# @returns sorted copy of array
def mergesort(array)
    # Base case
    if array.count <= 1
        return array
    end

    # Apply "Divide & Conquer" strategy
    # 1. Divide
    mid = array.count / 2
    left_partition = mergesort array.slice(0, mid)
    right_partition = mergesort array.slice(mid, array.count - mid)

    # 2. Conquer
    array = []
    left_lead = 0
    right_lead = 0
    while left_lead < left_partition.count && right_lead < right_partition.count
        a = left_partition[left_lead]
        b = right_partition[right_lead]

        # Take the smallest of the two, and push it on our array
        if a <= b
            array << a
            left_lead += 1
        else
            array << b
            right_lead += 1
        end
    end

    # Either left or right may have elements left; consume them.
    # (Only one of the following loops will actually be entered.)
    while left_lead < left_partition.count
        array << left_partition[left_lead]
        left_lead += 1
    end

    while right_lead < right_partition.count
        array << right_partition[right_lead]
        right_lead += 1
    end

    return array
end

# Vanilla quicksort function.
# Time complexity: on average O(nlogn); at worst O(n^2)
# Space complexity: at worst O(logn)
# @params array to be sorted, optional low and high
# @returns sorted copy of array
def quicksort(array, low=0, high=nil)
    # Sort the whole array, by default
    if high == nil
        high = array.count - 1
    end

    if low < high
        p = partition array, low, high
        quicksort array, low, p-1
        quicksort array, p+1, high
    end

    return array
end

def partition(array, low, high)
    i = low
    j = high + 1
    pivot = array[low]
    while true
    # Loop to increment i
        begin
            i += 1
            break if i==high
        end while array[i] < pivot
    # Loop to increment j
        begin 
            j -= 1
            break if j == low
        end while array[j] > pivot
        # break the loop if pointers cross    
        break if i >= j
    # Swap array[i] and array[j]
        temp=array[i]
        array[i]=array[j]
        array[j]=temp
    end
    # Swap array[low] with array[j]
    temp = array[low]
    array[low] = array[j]
    array[j] = temp
    return j
end

def printArr(array)
    print "{"
    for elem in array
        print "#{elem}, "
    end
    puts "\b\b}"
end

# main program
puts "\n\n"

puts "[Merge sort]"
i = 1
loop do 
    b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 0, -1].shuffle
    print "[#{i}] (random) = "
    printArr b
    b = mergesort b
    print "[#{i}] (sorted) = "
    printArr b
    puts
    i += 1
    break if i > 3
end

puts "[Quick sort]"
i = 1
loop do 
    a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 0, -1].shuffle
    print "[#{i}] (random) = "
    printArr a
    a = quicksort a
    print "[#{i}] (sorted) = "
    printArr a
    puts
    i += 1
    break if i > 3
end
