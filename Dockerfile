FROM nginx:1.27.3 
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
